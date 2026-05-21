## 🛑 Strict Dependency & Version Rules (No Fabrications)
* **Verify Reality First**: Never guess package APIs. Check `package.json` first to confirm the installed version of React or external libraries.
* **No Outdated/Hallucinated Syntax**: Do not use deprecated patterns (e.g., do not use `React.FC` unless explicitly requested, do not use outdated React Router or state management syntax). 
* **Inspect Types on Doubt**: If unsure about a library's exact exports or prop shapes, use terminal tools to read the `.d.ts` file directly from `node_modules`.
* **Zero Hallucination Tolerance**: If a package version or function signature is unknown, stop and ask me or use the search tool to find the official documentation. Do not invent props, hooks, or parameters.

## 🤐 Anti-Verbosity & Communication Rules
* **Code First, Silence Second**: Do not talk before or after code blocks. Omit "Sure, I can help," "Here is the updated code," and summaries of what the code does. 
* **Strictly Show Diffs**: Never output a whole 100-line React component just to change a single hook or prop. Only output the exact lines changing or a clean unified diff.
* **Type Inference Over Verbosity**: Do not explicitly type everything if TypeScript can infer it naturally (e.g., do not explicitly type obvious hook states like `useState(false)`).

## ⚛️ React & TypeScript Quality Guards
* **Strict Type Safety**: Avoid `any` entirely. Use `unknown` or define precise, explicit `type` or `interface` shapes for component props.
* **Modern React Conventions**: Use functional components, explicit semantic HTML tags, clean hooks, and early returns to keep components flat and readable.
* **No Placeholder Code**: Never insert `// TODO: implement later` comments inside code blocks. Write the complete logic or leave the existing logic untouched.
